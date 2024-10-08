pyenv install 3.11
pyenv local 3.11
poetry env use $(pyenv which python)

cat requirements.txt | xargs poetry add
poetry add trulens-apps-llamaindex trulens-providers-openai trulens_eval boto3 llmsherpa llama-index llama-index-readers-smart-pdf-loader tqdm llama-index-storage-docstore-firestore llama-index-storage-kvstore-firestore llama-index-storage-index-store-firestore llama-index-llms-openai firebase-admin google-auth llama-index-core llama-index-embeddings-huggingface llama-index-llms-huggingface llama-index-vector-stores-pinecone pinecone-client'>=3.0.0' bitsandbytes pydantic pydantic-settings google-auth