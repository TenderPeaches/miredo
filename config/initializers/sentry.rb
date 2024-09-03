Sentry.init do |config|
    config.dsn = "https://88f10fc5c97cf4c0fa2404b6ab31c87d@o4507833375457280.ingest.us.sentry.io/4507833375850496"

    config.breadcrumbs_logger = [:sentry_logger, :http_logger]

    # how many errors are sent from 0.0 to 1.0
    config.traces_sample_rate = 1.0

    config.profiles_sample_rate

end
