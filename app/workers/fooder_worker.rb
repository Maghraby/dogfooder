class FooderWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'dog-fooder-creator'

  def perform(args)
    Fooder.create!(args.deep_symbolize_keys!)
  end
end
