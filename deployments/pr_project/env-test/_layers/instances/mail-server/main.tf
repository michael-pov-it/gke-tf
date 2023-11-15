resource "google_service_account" "mail-server-sa" {
  account_id   = var.service_account_id
  display_name = "Mail-Server SA for VM Instance"
}

resource "google_compute_instance" "mail-server" {
  name         = var.instance_name
  machine_type = "n2-standard-2"
  zone         = var.isntance_zone

  tags = ["mail-server", "ownedBy-MikeGordievsky"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "mail-server"
      }
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    owner = "MikeGordievsky"
    startup_script = <<-EOF
  echo "hello
  you" > /test.txt
  echo "I'm the SendGrid
  Mail-Server 2023" > /test2.txt
  EOF
  }

  # metadata_startup_script = "/"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.mail-server-sa.email
    scopes = ["cloud-platform"]
  }
}
