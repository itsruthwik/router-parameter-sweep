#!/usr/bin/env python3

import os
import sys
import itertools
import math
from pathlib import Path

def generate_router_configs():
    # Define original file path
    original_file = Path('./router_wrap.sv')
    
    # Define output directory
    output_dir = Path('./router-wrap-sweep')
    output_dir.mkdir(exist_ok=True)
    
    # Define parameter values to sweep
    param_configs = {
        'NUM_PORTS': [5],
        'NOC_NUM_ENDPOINTS': [4, 9, 16],
        'FLIT_BUFFER_DEPTH': [1, 2, 4, 8],
        'SERDES_BUFFER_DEPTH': [1, 2, 4, 8],
        'TID_WIDTH': [2],
        'TDATA_WIDTH': [32, 64, 128],
        'SERIALIZATION_FACTOR': [1],
        'CLKCROSS_FACTOR': [1],
        'SINGLE_CLOCK': [0]
    }
    
    # Read original file content
    with open(original_file, 'r') as f:
        original_content = f.read()
    
    print(f"Generating router configurations...")
    
    # Generate core parameter combinations
    core_params = {
        'NUM_PORTS': param_configs['NUM_PORTS'],
        'NOC_NUM_ENDPOINTS': param_configs['NOC_NUM_ENDPOINTS'],
        'FLIT_BUFFER_DEPTH': param_configs['FLIT_BUFFER_DEPTH'],
        'SERDES_BUFFER_DEPTH': param_configs['SERDES_BUFFER_DEPTH']  
    }
    
    core_combinations = list(itertools.product(*core_params.values()))
    
    # Generate optional parameter combinations
    opt_params = {
        'TDATA_WIDTH': param_configs['TDATA_WIDTH'],
        'SINGLE_CLOCK': param_configs['SINGLE_CLOCK']
    }
    
    opt_combinations = list(itertools.product(*opt_params.values()))
    
    # Total combinations
    total_configs = len(core_combinations) * len(opt_combinations)
    print(f"Will generate {total_configs} different configurations")
    
    count = 0
    for core_combo in core_combinations:
        # Map values to parameter names
        core_values = {
            'NUM_PORTS': core_combo[0],
            'NOC_NUM_ENDPOINTS': core_combo[1],
            'FLIT_BUFFER_DEPTH': core_combo[2],
            'SERDES_BUFFER_DEPTH': core_combo[3], 
            'TDEST_WIDTH': math.ceil(math.log2(core_combo[1]))
        }
        
        for opt_combo in opt_combinations:
            # Map values to parameter names
            opt_values = {
                'TDATA_WIDTH': opt_combo[0],
                'SINGLE_CLOCK': opt_combo[1]
            }
            
            # Combine the parameter values
            params = {**core_values, **opt_values}
            
            # Create modified content
            modified_content = original_content
            
            # Replace each parameter in the file
            for param, value in params.items():
                # Generate pattern like: parameter NUM_PORTS = 5,
                pattern = f"parameter {param} = "
                # Find parameter line
                parts = modified_content.split(pattern)
                if len(parts) > 1:
                    # Split at the next comma or newline
                    value_part = parts[1].split(",", 1) if "," in parts[1] else parts[1].split("\n", 1)
                    if len(value_part) > 1:
                        # Replace only the value before the comma or newline
                        modified_content = pattern.join([parts[0], f"{value},{value_part[1]}"])
            
            # Generate descriptive filename
            filename = f"router_wrap_NE{params['NOC_NUM_ENDPOINTS']}_FB{params['FLIT_BUFFER_DEPTH']}_SB{params['SERDES_BUFFER_DEPTH']}_TD{params['TDATA_WIDTH']}_SC{params['SINGLE_CLOCK']}.sv"
            output_path = output_dir / filename
            
            # Write modified content to file
            with open(output_path, 'w') as f:
                f.write(modified_content)
            
            count += 1
            if count % 10 == 0:
                print(f"Generated {count}/{total_configs} configurations...")
    
    print(f"Successfully generated {count} router configurations in {output_dir}")

if __name__ == "__main__":
    generate_router_configs()