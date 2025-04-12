#!/usr/bin/env python3

import os
import re
import csv
import glob
from pathlib import Path

def extract_setup_timing(file_path):
    """Extract worst setup timing slack from timing report"""
    try:
        with open(file_path, 'r') as f:
            content = f.read()
            # Look for worst setup slack pattern
            match = re.search(r'Setup\s+slack\s+:\s+([-\d\.]+)', content)
            if match:
                return float(match.group(1))
    except Exception as e:
        print(f"Error extracting setup timing from {file_path}: {e}")
    return None

def extract_hold_timing(file_path):
    """Extract worst hold timing slack from timing report"""
    try:
        with open(file_path, 'r') as f:
            content = f.read()
            # Look for worst hold slack pattern
            match = re.search(r'Hold\s+slack\s+:\s+([-\d\.]+)', content)
            if match:
                return float(match.group(1))
    except Exception as e:
        print(f"Error extracting hold timing from {file_path}: {e}")
    return None

def extract_timing(file_path):
    file = open(file_path,"r")
    for line in file:
      if 'library setup time' in line:
        library_setup_time = re.findall(r'\d+\.{0,1}\d*', line)
      else:
        library_setup_time = [0]
      if 'data arrival time' in line:
        data_arrival_time = re.findall(r'\d+\.{0,1}\d*', line)
    try:
      total_delay =  float(library_setup_time[0]) + float(data_arrival_time[0])
    except NameError:
      total_delay =  float(data_arrival_time[0])
    file.close()
    return total_delay

def extract_area(file_path):
    """Extract area from summary report"""
    try:
        with open(file_path, 'r') as f:
            content = f.read()
            # Look for area pattern
            match = re.search(r'Total area of Core:\s*([\d\.]+)', content)
            if match:
                return float(match.group(1))
    except Exception as e:
        print(f"Error extracting area from {file_path}: {e}")
    return None

def extract_power(file_path):
    """Extract power information from power report"""
    try:
        with open(file_path, 'r') as f:
            content = f.read()
            # Look for power patterns
            total_match = re.search(r'Total Power\s+=\s+([\d\.]+)\s+(\w+)', content)
            if total_match:
                return float(total_match.group(1))
    except Exception as e:
        print(f"Error extracting power from {file_path}: {e}")
    return None

def parse_config_from_dirname(dirname):
    """Parse configuration parameters from directory name"""
    config = {}
    parts = dirname.split('_')
    
    for part in parts:
        if part.startswith('NE'):
            config['NOC_NUM_ENDPOINTS'] = part[2:]
        elif part.startswith('FB'):
            config['FLIT_BUFFER_DEPTH'] = part[2:]
        elif part.startswith('SB'):
            config['SERDES_BUFFER_DEPTH'] = part[2:]
        elif part.startswith('TD'):
            config['TDATA_WIDTH'] = part[2:]
        elif part.startswith('SF'):
            config['SERIALIZATION_FACTOR'] = part[2:]
        elif part.startswith('SC'):
            config['SINGLE_CLOCK'] = part[2:]
    
    return config

def analyze_results():
    """Analyze all router parameter sweep results"""
    results_base_dir = Path("./run-files/results")
    output_csv = Path("./router_sweep_results.csv")
    
    # Check if results directory exists
    if not results_base_dir.exists():
        print(f"Error: Results directory {results_base_dir} not found")
        return False
    
    # Get all result directories
    result_dirs = [d for d in results_base_dir.iterdir() if d.is_dir()]
    
    if not result_dirs:
        print(f"No result directories found in {results_base_dir}")
        return False
    
    print(f"Found {len(result_dirs)} result directories to analyze")
    
    # Prepare CSV headers
    headers = [
        'NOC_NUM_ENDPOINTS', 
        'FLIT_BUFFER_DEPTH', 
        'SERDES_BUFFER_DEPTH', 
        'TDATA_WIDTH', 
        'SERIALIZATION_FACTOR', 
        'SINGLE_CLOCK',
        'Setup Slack (ns)',
        'Hold Slack (ns)',
        'Area (um²)',
        'Power (mW)'
    ]
    
    # Initialize results list
    results = []
    
    # Process each result directory
    for idx, result_dir in enumerate(sorted(result_dirs)):
        if idx == 0:
            print(f"[{idx+1}/{len(result_dirs)}] Processing {result_dir.name}")

            # Parse configuration from directory name
            config = parse_config_from_dirname(result_dir.name)

            # File paths for different reports
            timing_file = result_dir / "timing.rpt"
            area_file = result_dir / "innovus_signoff_summary.rpt"
            power_file = result_dir / "power.rpt"

            print("result dir: " + str(result_dir))
            print("timing file: " + str(timing_file))
            print("area file: " + str(area_file))
            print("power file: " + str(power_file))

            # Extract metrics
            # setup_slack = extract_setup_timing(timing_file) if timing_file.exists() else None
            # hold_slack = extract_hold_timing(timing_file) if timing_file.exists() else None
            area = extract_area(area_file) if area_file.exists() else None

            print("area: " )
            print( area)

            total_delay = extract_timing(timing_file) if timing_file.exists() else None
            print("total delay: " )
            print( total_delay)

            # power = extract_power(power_file) if power_file.exists() else None

            # Create result row
            row = {
                'NOC_NUM_ENDPOINTS': config.get('NOC_NUM_ENDPOINTS', 'N/A'),
                'FLIT_BUFFER_DEPTH': config.get('FLIT_BUFFER_DEPTH', 'N/A'),
                'SERDES_BUFFER_DEPTH': config.get('SERDES_BUFFER_DEPTH', 'N/A'),
                'TDATA_WIDTH': config.get('TDATA_WIDTH', 'N/A'),
                'SERIALIZATION_FACTOR': config.get('SERIALIZATION_FACTOR', 'N/A'),
                'SINGLE_CLOCK': config.get('SINGLE_CLOCK', 'N/A'),
                # 'Setup Slack (ns)': setup_slack,
                # 'Hold Slack (ns)': hold_slack,
                'Area (um²)': area,
                # 'Power (mW)': power
            }

            # results.append(row)
            # print(f"  - Configuration: NOC_ENDPOINTS={config.get('NOC_NUM_ENDPOINTS', 'N/A')}, "
            #       f"FLIT_BUFFER={config.get('FLIT_BUFFER_DEPTH', 'N/A')}, "
            #       f"SERDES_BUFFER={config.get('SERDES_BUFFER_DEPTH', 'N/A')}, "
                #   f"Setup Slack={setup_slack}, Hold Slack={hold_slack}")
    
    # Write results to CSV
    # with open(output_csv, 'w', newline='') as csvfile:
    #     writer = csv.DictWriter(csvfile, fieldnames=headers)
    #     writer.writeheader()
    #     writer.writerows(results)
    
    # print(f"\nResults analysis completed. Output saved to {output_csv}")
    
    # Generate basic statistics
    print("\nBasic Statistics:")
    successful_runs = sum(1 for r in results if r['Setup Slack (ns)'] is not None)
    print(f"Total configurations: {len(results)}")
    print(f"Successful runs: {successful_runs}")
    if successful_runs > 0:
        met_timing = sum(1 for r in results if r['Setup Slack (ns)'] is not None and r['Setup Slack (ns)'] >= 0)
        print(f"Configurations meeting timing: {met_timing} ({met_timing/successful_runs*100:.1f}%)")
    
    return True

if __name__ == "__main__":
    analyze_results()