#!/bin/bash
echo "🚀 Starting Full Experiment Pipeline for Gödel-Fitch RL..."

# Stop on error
set -e

echo "1. Generating Synthetic Data via Rocq..."
# python scripts/generate_synthetic_data.py

echo "2. Training Baseline Agent (Pure PPO)..."
python baselines/pure_ppo_agent.py

echo "3. Training Scope-Constrained Agent (Ours)..."
python scripts/train_agent.py --config configs/experiment_01_grammar.yaml

echo "4. Generating Paper Figures..."
python scripts/generate_plots.py

echo "✅ All experiments finished successfully! Ready for ArXiv."
