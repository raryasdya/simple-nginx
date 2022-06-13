from fastapi import FastAPI


app = FastAPI()


@app.get("/read/{npm}")
def get_student_by_id(npm: str):

    # TODO retrieve data from database

    return {
        "status": "OK",
        "npm": npm,
        "name": "name",
    }
