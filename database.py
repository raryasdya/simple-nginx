import os
from dotenv import find_dotenv, load_dotenv
from supabase import create_client, Client


load_dotenv(find_dotenv())

url: str = os.environ.get("SUPABASE_URL")
key: str = os.environ.get("SUPABASE_KEY")

db: Client = create_client(url, key)
