Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "249607688534353", "b0c176d24cff4aeac5f113feac59271e"
end