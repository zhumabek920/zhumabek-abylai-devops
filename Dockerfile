# Base image with Python
FROM python:3.12-slim

# Working directory inside the container
WORKDIR /app

# Copy application and student info into the image
COPY app/ /app/
COPY Zhumabek_Abylai_info.txt /app/

# Check the code compiles and create a non-root user
RUN python -m py_compile /app/app.py && useradd -m appuser

# Default values (can be overridden with docker run -e ...)
ENV STUDENT_NAME=Abylai \
    STUDENT_SURNAME=Zhumabek \
    STUDENT_GROUP=IT2-2306 \
    STUDENT_ID=38304 \
    PYTHONUNBUFFERED=1

USER appuser

# The application listens on port 8080
EXPOSE 8080

# Start the application
CMD ["python", "app.py"]
