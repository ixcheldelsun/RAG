# reset:
# 	echo "Stopping the jupyter notebook"
# 	jupyter notebook list | grep "./RAG.ipynb" | awk -F ' ' '{print $1}' | sed 's/^.*://' | xargs -I {} jupyter notebook stop {}
# 	echo "Resetting the environment"
# 	sudo rm -rf $(poetry env info --path)
# 	poetry install --no-root

stop-notebook:
	@echo "Stopping all running Jupyter notebooks..."
	@jupyter notebook list | grep "http" | awk -F ' ' '{print $$1}' | sed 's/^.*://' | xargs -I {} jupyter notebook stop {} || echo "No notebooks are currently running."

clean-env:
	@echo "Cleaning up the Poetry environment..."
	@sudo rm -rf $(poetry env info --path)
	@sudo rm -rf __pycache__ .pytest_cache .ipynb_checkpoints .mypy_cache || echo "No cache directories found."

create-env:
	@echo "Creating a new Poetry environment..."
	@poetry install
	@echo "Poetry environment setup is complete."

reset: stop-notebook clean-env create-env