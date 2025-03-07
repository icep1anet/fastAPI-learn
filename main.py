from fastapi import FastAPI

from parameter import parameter_router
from auth import auth_router

app = FastAPI()

# app.include_router(parameter_router)
app.include_router(auth_router)

@app.get("/")
async def root():
    return {"message": "Hello World"}

