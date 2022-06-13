from fastapi import FastAPI

from database import db


app = FastAPI()


@app.get("/{npm}")
def main(npm: str):

    student = db.table("students").select("*").eq("npm", npm).execute().data[0]

    return {
        "status": "OK",
        "npm": student["npm"],
        "name": student["name"],
    }
