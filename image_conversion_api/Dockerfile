
# Use Python 3.11 as base image
FROM python:3.11-slim

WORKDIR /app
COPY . .

RUN apt update
RUN apt -y install build-essential
RUN apt -y install libcairo2-dev libjpeg-dev libgif-dev

RUN pip install pipenv
RUN pipenv sync

EXPOSE 8000

# Command to run the Python script
CMD ["pipenv", "run", "uvicorn", "api:app", "--port", "8000"]