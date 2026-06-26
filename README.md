# Jenkins Agent (Python)

A Python3 Jenkins Agent.

Tags are maintained for all actively supported Python versions per https://devguide.python.org/versions/

## Publish a NEW Python version

1. Set your preferred Python version

```bash
export PYTHON_VERSION=3.12
```

2. Set your DOCKERHUB username

```bash
export DOCKERHUB_USERNAME=<your-dockerhub-username>
```

3. Build the image

```bash
docker build \
  --build-arg PYTHON_VERSION=${PYTHON_VERSION} \
  -t jenkins-agent-python:${PYTHON_VERSION} .
```

4. Verify version

```bash
docker run --rm jenkins-agent-python:${PYTHON_VERSION} python3 --version
```


5. Tag & Push to DockerHub

```bash
docker tag jenkins-agent-python:${PYTHON_VERSION} $DOCKERHUB_USERNAME/jenkins-agent-python:${PYTHON_VERSION}
docker push $DOCKERHUB_USERNAME/jenkins-agent-python:${PYTHON_VERSION}
```

