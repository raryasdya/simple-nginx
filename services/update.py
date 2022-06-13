from fastapi import FastAPI
from pydantic import BaseModel

from database import db

app = FastAPI()


class Student(BaseModel):
    npm: str
    name: str


@app.post("/")
def main(student: Student):

    db.table("students").insert({"npm": student.npm, "name": student.name}).execute()

    return {
        "status": 'OK',
    }
