#!/usr/bin/env python3

import os
import shutil
import sys
from pathlib import Path
import subprocess
import time

def run_router_sweep():
    # Define source and destination directories
    sweep_dir = Path("./router-wrap-sweep")
    dest_dir = Path("./run-files/rtl")
    
    # Create destination directory if it doesn't exist
    dest_dir.mkdir(parents=True, exist_ok=True)
    
    # Get all router wrap files
    router_files = sorted(list(sweep_dir.glob("*.sv")))
    total_files = len(router_files)
    
    print(f"Found {total_files} router configurations to process")
    
    # # Copy all .sv files from ./src to ./run-files/rtl
    # src_dir = Path("./src")
    # src_files = list(src_dir.glob("*.sv"))
    
    # for src_file in src_files:
    #     shutil.copy2(src_file, dest_dir)
    #     print(f"Copied {src_file.name} from {src_dir} to {dest_dir}")
    
    make_run_nums = [4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 18]
    original_dir = Path.cwd()
    # Process each file one by one
    for idx, router_file in enumerate(router_files):
        if idx != 250:
            file_name = router_file.name
            print(file_name)

            print(f"\n[{idx+1}/{total_files}] Processing {file_name}")

            # Copy the router file to the destination directory
            dest_file = dest_dir / "router_wrap.sv"  # Copy as the standard name
            shutil.copy2(router_file, dest_file)

            print(f"  - Copied {file_name} to {dest_dir}/router_wrap.sv")

            # Parse configuration from filename
            config_parts = file_name.replace("router_wrap_", "").replace(".sv", "").split("_")
            config = {part[:2]: part[2:] for part in config_parts}

            print(f"  - Configuration: NOC_ENDPOINTS={config.get('NE', 'unknown')}, "
                  f"FLIT_BUFFER={config.get('FB', 'unknown')}, "
                  f"SERDES_BUFFER={config.get('SB', 'unknown')}, "
                  f"TDATA_WIDTH={config.get('TD', 'unknown')}, "
                  f"SERIALIZATION_FACTOR={config.get('SF', 'unknown')}")

            # Change directory to build_axis
            os.chdir("/mnt/vault0/rsunketa/mflowgen/build_axis")
            print(f"  - Changed directory to {os.getcwd()}")

            # Remove previous stamps
            result = subprocess.run("./remove_stamps.sh", capture_output=True, text=True)
            if result.returncode != 0:
                print("ERROR: remove_stamps script failed")
                print(f"Output: {result.stdout}")
                print(f"Error: {result.stderr}")
                return False

            print("  - remove_stamps.sh executed successfully")

            # Execute make targets in sequence
            for make_target in make_run_nums:
                print(f"  - Executing 'make {make_target}'...")
                result = subprocess.run(["make", str(make_target)], capture_output=True, text=True)

                if result.returncode == 0:
                    print(f"  - 'make {make_target}' executed successfully")
                else:
                    print(f"ERROR: 'make {make_target}' failed with error:\n{result.stderr}")
                    print(f"Configuration: {file_name}")
                    return False

            # Create output directory to store results for this configuration
            results_dir = original_dir / "run-files" / "results" / file_name.replace('.sv', '')
            results_dir.mkdir(parents=True, exist_ok=True)

            # Copy important output files to results directory
            try:
                # Add commands to copy synthesis reports, timing reports, etc.
                # Example: shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/4-synopsys-dc-synthesis/reports/timing.rpt", results_dir)
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/15-cadence-innovus-signoff/reports/signoff.summaryReport.rpt", results_dir/"innovus_signoff_summary.rpt")
                # print(f"  - Copied signoff.summaryReport.rpt to {results_dir}")
                # shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_nocgen/14-cadence-innovus-signoff/reports/signoff.timingReport.rpt", results_dir/"")
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/router_wrap.timing.outputs.t_setup.rpt" , results_dir/"router_wrap.timing.outputs.t_setup.rpt" )
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/router_wrap.timing.inputs.t_setup.rpt" , results_dir/"router_wrap.timing.inputs.t_setup.rpt" )
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/router_wrap.timing.outputs.t_hold.rpt" , results_dir/"router_wrap.timing.outputs.t_hold.rpt" )
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/router_wrap.timing.inputs.t_hold.rpt" , results_dir/"router_wrap.timing.inputs.t_hold.rpt" )
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/router_wrap.timing.outputs.t_clk2q.rpt" , results_dir/"router_wrap.timing.outputs.t_clk2q.rpt" )
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/router_wrap.timing.inputs.t_clk2q.rpt" , results_dir/"router_wrap.timing.inputs.t_clk2q.rpt" )
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/router_wrap.timing.t_comb.rpt" , results_dir/"router_wrap.timing.t_comb.rpt" )
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/timing.rpt" , results_dir/"timing.rpt" )
                shutil.copy2("/mnt/vault0/rsunketa/mflowgen/build_axis/18-synopsys-pt-timing-signoff/reports/power.rpt" , results_dir/"power.rpt" )

            except Exception as e:
                print(f"Warning: Could not copy output files: {str(e)}")

            # Change back to the original directory
            os.chdir("/mnt/vault0/rsunketa/router-parameter-sweep")

    print(f"\nSuccessfully processed all {total_files} router configurations")
    return True

if __name__ == "__main__":
    success = run_router_sweep()
    if not success:
        sys.exit(1)