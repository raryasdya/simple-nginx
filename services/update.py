from fastapi import FastAPI
from pydantic import BaseModel


app = FastAPI()


class Student(BaseModel):
    npm: str
    name: str


@app.post("/update")
def main(student: Student):

    # TODO: save data to database

    return {
        "status": 'OK',
    }
