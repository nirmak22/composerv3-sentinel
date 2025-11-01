terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }

  cloud {
    organization = "composerv3-sentinel-policies"
    workspaces {
      name = "composerv3-sentinel"
    }
  }
}
provider "google" {
  project = "kyndryl-sydney-sandbox"
  region  = "us-central1"
}

#Non-compliant: No encryption block
resource "google_storage_bucket" "example" {
  name     = "unencrypted-demo-bucket-${random_id.suffix.hex}"
  location = "US"
}

resource "random_id" "suffix" {
  byte_length = 2
}

# Compliant version (uncomment to test success)
# resource "google_storage_bucket" "example" {
#   name     = "encrypted-demo-bucket-${random_id.suffix.hex}"
#   location = "US"
#
#   encryption {
#     default_kms_key_name = "projects/your-gcp-project-id/locations/us-central1/keyRings/your-keyring/cryptoKeys/your-key"
#   }
# }
