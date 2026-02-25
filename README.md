# Goshen Finance Plc — Cybersecurity Awareness Newsletter

> Volume 1, Issue 1, 2026

🌐 **Live Site:** [https://goshenfinanceplc.netlify.app/](https://goshenfinanceplc.netlify.app/) <br>
🐳 **Docker Hub:** [https://hub.docker.com/r/denoella/goshenfinanceplc](https://hub.docker.com/r/denoella/goshenfinanceplc)

---

## About

This website is Goshen Finance Plc's Cybersecurity Awareness Newsletter (Volume 1, Issue 1, 2026). It's an internal, single-page newsletter for staff that explains cybersecurity in simple language.

---

## What It Covers

- Main threats — phishing emails, ransomware, impersonation, and USB baiting
- Practical **"Do This, Not That"** tips
- How to create and manage strong passwords
- A short quiz
- Contact info for reporting incidents

---

## Goal

To help every employee act as a first line of defence for the bank, its customers, and their money.

---

## Languages

The whole newsletter is available in **English** and **Kinyarwanda**, with a toggle so users can switch between the two languages.

---

## 🐳 Docker Deployment

This app has been containerized using Docker and served via **nginx**. Below are the steps taken to go from a plain HTML file to a published image on Docker Hub.

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
- A [Docker Hub](https://hub.docker.com/) account

---

### Step 1 — Write the Dockerfile

Create a `Dockerfile` in the root of the project:

```dockerfile
# Declare the Base Image
FROM nginx:alpine

# Set a Work Directory
WORKDIR /usr/share/nginx/html

# Copy files
COPY . .

# Expose nginx port
EXPOSE 80

# Command
CMD ["nginx", "-g", "daemon off;"]
```

> ⚠️ **Common mistakes to avoid:**
> - Do **not** add a semicolon (`;`) after the `WORKDIR` path — it will be passed literally into nginx and cause a startup error.
> - The `daemon off;` string in the `CMD` **must** include the semicolon inside the quotes — it is an nginx directive, not shell syntax.

---

### Step 2 — Build the Docker Image

Run this command from the project folder:

```bash
docker build -t goshenfinanceplc .
```

Verify the image was created:

```bash
docker images
```

---

### Step 3 — Run the Container Locally

```bash
docker run -p 80:80 goshenfinanceplc
```

Then open your browser and go to **http://localhost** to confirm the app is running.

To run in the background (detached mode):

```bash
docker run -p 80:80 -d goshenfinanceplc
```

Check that it's running:

```bash
docker ps
```

---

### Step 4 — Tag the Image for Docker Hub

Replace `denoella` with your own Docker Hub username:

```bash
docker tag goshenfinanceplc denoella/goshenfinanceplc
```

---

### Step 5 — Log In to Docker Hub

```bash
docker login
```

Enter your Docker Hub username and password when prompted.

---

### Step 6 — Push the Image to Docker Hub

```bash
docker push denoella/goshenfinanceplc
```

Once the push is complete, your image is publicly available at:
**https://hub.docker.com/r/denoella/goshenfinanceplc**

---

### Pulling and Running the Image (Anyone)

Anyone can now pull and run the app without needing the source code:

```bash
docker pull denoella/goshenfinanceplc
docker run -p 80:80 denoella/goshenfinanceplc
```

Then open **http://localhost** in the browser.
