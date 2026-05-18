# ============================================================
# Stage 1: BASE IMAGE
# Ubuntu base with Python + system dependencies
# ============================================================
FROM ubuntu:22.04 AS base

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# FIX 1: "apt-get update && upgrade -y" → "apt-get update && apt-get install -y"
RUN apt-get update && apt-get install -y \
    python3.11 \
    python3.11-venv \
    python3-pip \
    curl \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set python3.11 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1 \
    && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1

WORKDIR /app

# ============================================================
# Stage 2: BUILDER
# Install Python dependencies in an isolated layer
# ============================================================
FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3.11 \
    python3.11-venv \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

# FIX 2: Create venv first, THEN set ENV PATH (can't reference $PATH before declaring)
RUN python3.11 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# ============================================================
# Stage 3: FINAL / RUNTIME IMAGE
# Lean image — only what's needed to run the app
# ============================================================
FROM ubuntu:22.04 AS final

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3.11 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# FIX 3: AS keyword must be uppercase to match FROM (FromAsCasing warning)
# All three stages now use "FROM ... AS" consistently
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Non-root user for security
RUN useradd --create-home --shell /bin/bash appuser
USER appuser

WORKDIR /app

COPY --chown=appuser:appuser . .

EXPOSE 8000

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

CMD ["python", "app.py"]