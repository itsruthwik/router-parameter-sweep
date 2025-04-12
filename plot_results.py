#!/usr/bin/env python3

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
from pathlib import Path

def load_data(csv_file="./router_sweep_results.csv"):
    """Load the router parameter sweep results from CSV"""
    try:
        df = pd.read_csv(csv_file)
        print(f"Loaded {len(df)} rows from {csv_file}")
        
        # Convert 'N/A' to NaN for numeric processing
        for col in df.columns:
            if df[col].dtype == object:
                try:
                    df[col] = pd.to_numeric(df[col], errors='coerce')
                except:
                    pass
        
        return df
    except Exception as e:
        print(f"Error loading data: {e}")
        return None

def plot_parameter_dual_metrics(df, parameter, output_dir="./plots"):
    """Plot both area and delay against a parameter using dual y-axes"""
    # ... existing implementation ...

def find_best_configurations(df, output_dir="./plots"):
    """Find the best configurations in terms of area and delay trade-offs"""
    Path(output_dir).mkdir(exist_ok=True)
    
    # Drop rows with missing area or delay values
    df_complete = df.dropna(subset=['Area (um²)', 'Total Delay (ns)'])
    
    if len(df_complete) == 0:
        print("No configurations with both area and delay data available")
        return
    
    print(f"\nAnalyzing {len(df_complete)} configurations with complete data...")
    
    # Normalize area and delay to 0-1 scale for comparison
    df_complete['Area_Normalized'] = (df_complete['Area (um²)'] - df_complete['Area (um²)'].min()) / \
                                   (df_complete['Area (um²)'].max() - df_complete['Area (um²)'].min())
    
    df_complete['Delay_Normalized'] = (df_complete['Total Delay (ns)'] - df_complete['Total Delay (ns)'].min()) / \
                                     (df_complete['Total Delay (ns)'].max() - df_complete['Total Delay (ns)'].min())
    
    # Create a combined score (lower is better)
    # Equal weight to area and delay by default
    df_complete['Combined_Score'] = df_complete['Area_Normalized'] + df_complete['Delay_Normalized']
    
    # Find Pareto-optimal configurations (where no other configuration is better in both metrics)
    pareto_optimal = []
    for i, row in df_complete.iterrows():
        is_pareto = True
        for j, other_row in df_complete.iterrows():
            if i != j:
                if (other_row['Area (um²)'] <= row['Area (um²)'] and 
                    other_row['Total Delay (ns)'] < row['Total Delay (ns)']) or \
                   (other_row['Area (um²)'] < row['Area (um²)'] and 
                    other_row['Total Delay (ns)'] <= row['Total Delay (ns)']):
                    is_pareto = False
                    break
        if is_pareto:
            pareto_optimal.append(i)
    
    df_pareto = df_complete.loc[pareto_optimal]
    
    # Get top configurations by combined score
    top_configs = df_complete.nsmallest(10, 'Combined_Score')
    
    # Plot all configurations with Pareto front highlighted
    plt.figure(figsize=(12, 10))
    
    # Plot all points
    plt.scatter(df_complete['Area (um²)'], df_complete['Total Delay (ns)'], 
                alpha=0.6, label='All Configurations')
    
    # Highlight Pareto optimal configurations
    plt.scatter(df_pareto['Area (um²)'], df_pareto['Total Delay (ns)'], 
                color='red', s=100, label='Pareto Optimal')
    
    # Highlight top 3 by combined score
    plt.scatter(top_configs.head(3)['Area (um²)'], top_configs.head(3)['Total Delay (ns)'], 
                color='green', s=150, marker='*', label='Top 3 Overall')
    
    # Label the top configurations
    for i, row in top_configs.head(5).iterrows():
        config_label = f"NE{row['NOC_NUM_ENDPOINTS']}-FB{row['FLIT_BUFFER_DEPTH']}-SB{row['SERDES_BUFFER_DEPTH']}"
        plt.annotate(config_label, 
                     (row['Area (um²)'], row['Total Delay (ns)']),
                     xytext=(10, 5), textcoords='offset points',
                     bbox=dict(boxstyle="round,pad=0.3", fc="white", ec="gray", alpha=0.8))
    
    plt.title('Area vs Delay Trade-off Analysis')
    plt.xlabel('Area (um²)')
    plt.ylabel('Total Delay (ns)')
    plt.grid(True, linestyle='--', alpha=0.7)
    plt.legend()
    
    plt.tight_layout()
    plt.savefig(f"{output_dir}/best_configurations.png")
    plt.close()
    
    # Print summary of best configurations
    print("\n===== BEST CONFIGURATIONS =====")
    print("\nTop 10 configurations by combined score (lower is better):")
    
    # Format for clean display
    summary_cols = ['NOC_NUM_ENDPOINTS', 'FLIT_BUFFER_DEPTH', 'SERDES_BUFFER_DEPTH', 
                    'TDATA_WIDTH', 'SERIALIZATION_FACTOR', 'SINGLE_CLOCK',
                    'Area (um²)', 'Total Delay (ns)', 'Combined_Score']
    
    pd.set_option('display.max_columns', None)
    pd.set_option('display.width', 120)
    print(top_configs[summary_cols].to_string(index=False, float_format=lambda x: f"{x:.2f}"))
    
    print("\nPareto-optimal configurations (no configuration is better in both area and delay):")
    print(df_pareto[summary_cols].to_string(index=False, float_format=lambda x: f"{x:.2f}"))
    
    # Save detailed results to CSV
    top_configs.to_csv(f"{output_dir}/top_configurations.csv", index=False)
    df_pareto.to_csv(f"{output_dir}/pareto_optimal_configurations.csv", index=False)
    
    # Print recommendation
    best_overall = top_configs.iloc[0]
    print("\n===== RECOMMENDATION =====")
    print(f"Best overall configuration (lowest combined score):")
    print(f"  NOC_NUM_ENDPOINTS: {best_overall['NOC_NUM_ENDPOINTS']}")
    print(f"  FLIT_BUFFER_DEPTH: {best_overall['FLIT_BUFFER_DEPTH']}")
    print(f"  SERDES_BUFFER_DEPTH: {best_overall['SERDES_BUFFER_DEPTH']}")
    print(f"  TDATA_WIDTH: {best_overall['TDATA_WIDTH']}")
    print(f"  SERIALIZATION_FACTOR: {best_overall['SERIALIZATION_FACTOR']}")
    print(f"  SINGLE_CLOCK: {best_overall['SINGLE_CLOCK']}")
    print(f"  Area: {best_overall['Area (um²)']:.2f} um²")
    print(f"  Delay: {best_overall['Total Delay (ns)']:.2f} ns")
    
    return top_configs, df_pareto

def main():
    # Load data
    df = load_data()
    if df is None or df.empty:
        print("No data available for plotting")
        return
    
    # Create output directory
    output_dir = "./plots"
    Path(output_dir).mkdir(exist_ok=True)
    
    # Print data summary
    print("\nData Summary:")
    print(df.describe())
    
    # Define parameters to analyze
    parameters = [
        'NOC_NUM_ENDPOINTS',
        'FLIT_BUFFER_DEPTH',
        'SERDES_BUFFER_DEPTH',
        'TDATA_WIDTH',
        'SERIALIZATION_FACTOR',
        'SINGLE_CLOCK'
    ]
    
    print("\nGenerating dual-axis plots for each parameter...")
    for param in parameters:
        if param in df.columns:
            plot_parameter_dual_metrics(df, param, output_dir)
    
    # Find best configurations
    print("\nFinding best configurations...")
    find_best_configurations(df, output_dir)
    
    print(f"\nAll plots and analysis results generated in {output_dir}/")

if __name__ == "__main__":
    main()