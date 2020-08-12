resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machinetype
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server","mediawiki"]

  connection {
    type  = "ssh"
    host  = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
    user  = var.ssh_user
    private_key = file("key")
  }

  provisioner "file" {
    source      = "mediawiki.sh"
    destination = "/tmp/mediawiki.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/mediawiki.sh",
      "sh /tmp/mediawiki.sh"
    ]
  }

}

resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http-terraform"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "mediawiki-firewall" {
  name    = "mediawiki"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = [var.port]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["mediawiki"]
}


output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}

