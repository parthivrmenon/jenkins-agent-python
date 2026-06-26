# Jenkins Agent (Python)

A Jenkins Docker Cloud Agent with Python 3, built on top of the official [`jenkins/agent`](https://hub.docker.com/r/jenkins/agent) base image. Python is managed via [pyenv](https://github.com/pyenv/pyenv), allowing any Python 3 version to be selected simply by choosing the appropriate image tag.

## Available Tags

| Tag | Python Version |
|-----|---------------|
| `3.10` | Python 3.10 |
| `3.11` | Python 3.11 |
| `3.12` | Python 3.12 |
| `3.13` | Python 3.13 |

## Usage

In your Jenkins Docker Cloud Agent Template, set the **Docker Image** field to the desired tag:

```
pluto92/jenkins-agent-python:3.12
```

Target this agent in a pipeline using the label `python-agent`:

```groovy
pipeline {
    agent {
        label 'python-agent'
    }
    stages {
        stage('Run') {
            steps {
                sh 'python3 --version'
            }
        }
    }
}
```

## Python Version Management

Python is installed and managed via `pyenv`. You can verify the active version inside a running agent:

```bash
python3 --version
pyenv version
```

## Source

[github.com/parthivrmenon/jenkins-agent-python](https://github.com/parthivrmenon/jenkins-agent-python)
