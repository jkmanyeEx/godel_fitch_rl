# Research Project Makefile

.PHONY: train plot paper clean all

# 1. RL 에이전트 학습 (MPS 가속 사용 권장)
train:
	python scripts/train_agent.py --config configs/experiment_01_grammar.yaml

# 2. 실험 결과 시각화 (논문용 PDF 그래프 생성)
plot:
	python scripts/generate_plots.py --log_dir data/checkpoints --out_dir paper/figures

# 3. 논문 컴파일 (LaTeX)
paper:
	cd paper && pdflatex main.tex && bibtex main && pdflatex main.tex

# 4. 전체 파이프라인 원클릭 실행
all: train plot paper

# 5. 더미 파일 청소
clean:
	rm -rf data/checkpoints/*.pth paper/*.aux paper/*.log
