# We use python:3 image, from Dockerhub instead of Django image because this image is officially deprecated in favor of the standard python image
FROM python:3.9

# Update & git install
RUN apt update && apt install git libpq-dev python3-dev graphviz libgraphviz-dev pkg-config gcc -y && pip install psycopg2-binary==2.8.6 psycopg2==2.8.6 pygraphviz ipdb


# Clone the code from my public repo
WORKDIR /app
COPY ~/devops-challenge/app/backend .


# Install dependencies
RUN pip3 cache purge
RUN pip3 install --ignore-installed --no-cache-dir -r requirements.txt

# Expose port 8000 for the Django application
EXPOSE 8000

# Set privilegs and define the entrypoint script
RUN chmod +x scripts/entrypoint.sh
ENTRYPOINT ["scripts/entrypoint.sh"]