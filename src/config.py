from typing import List

from dotenv import load_dotenv
from pydantic_settings import BaseSettings

# Load environment variables from .env file
load_dotenv()


class Settings(BaseSettings):
    app_name: str = "RAG"

    # Database settings
    ## FIRESTORE
    credentials_json_name: str = "RAGDOC firebase-adminsdk.json"
    firestore_collection: str
    firestore_project: str
    firestore_database: str = "(default)"

    ## PINECONE
    pinecone_api_key: str

    # AWS
    aws_access_key: str
    aws_secret_access_key: str
    aws_region: str = "us-east-2"
    aws_s3_output_bucket: str
    aws_s3_input_bucket: str

    # buckets
    aws_s3_input_bucket: str = "rag-input-pdfs"
    aws_s3_output_bucket: str = "rag-outputs-pdf"

    # Models
    ## Hugging Face
    hf_token: str

    ## OpenAI
    openai_api_key: str

    # Input documents
    input_documents: List[str]


settings = Settings()
