data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      "user:witty87@google.com",
    ]
  }
}

resource "google_project_iam_policy" "project" {
  project     = "gke-test-tf1"
  policy_data = data.google_iam_policy.admin.policy_data
}

# resource "google_service_account" "mike-name" {
#   account_id = "mike-name"
#   display_name = "SA"
# }

# resource "google_project_iam_member" "mike-owner" {
#   project = "gke-test-tf1"
#   role    = "roles/editor"
#   member  = "serviceAccount:mike-test-gke1@gke-test-tf1.iam.gserviceaccount.com"// "serviceAccount:${google_service_account.mike-name.email}"
# }
