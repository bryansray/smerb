Merb.logger.info("Loaded DEVELOPMENT Environment...")
Merb::Config.use { |c|
  c[:exception_details] = true
  c[:reload_classes] = true
  c[:reload_time] = 0.5
  c[:log_auto_flush ] = true
}

# For debugging datamapper queries
Merb::BootLoader.after_app_loads do
  DataObjects::Mysql.logger = DataObjects::Logger.new('log/dm.log', 0)
end