terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Run container
resource "docker_container" "nginx_container" {
  image = docker_image.nginx.image_id
  name  = "my-nginx"
  ports {
    internal = 80
    external = 8080
  }
}
