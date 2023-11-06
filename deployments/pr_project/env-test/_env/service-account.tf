resource "google_service_account" "mike-name" {
  account_id = "mike-name"
  display_name = "SA"
}

resource "google_project_iam_member" "firestore_owner_binding" {
  project = "gke-test-tf1"
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.mike-name.email}"
}
