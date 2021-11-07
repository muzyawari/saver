Sentry.init do |config|
  config.dsn = "https://ae3f0973417a419ebed875b14adcc3d6@o1062493.ingest.sentry.io/6052901"
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
