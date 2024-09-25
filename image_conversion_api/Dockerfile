
# Use Python 3.11 as base image
FROM python:3.11-slim

WORKDIR /app
COPY . .

RUN pip install pipenv
RUN pipenv sync

EXPOSE 8000

# Command to run the Python script
CMD ["pipenv", "run", "uvicorn", "api:app", "--port", "8000"]