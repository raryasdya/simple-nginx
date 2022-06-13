from fastapi import FastAPI

from database import db


app = FastAPI()


@app.get("/read/{npm}")
def get_student_by_id(npm: str):

    student = db.table("students").select("*").eq("npm", npm).execute().data[0]

    return {
        "status": "OK",
        "npm": student["npm"],
        "name": student["name"],
    }
