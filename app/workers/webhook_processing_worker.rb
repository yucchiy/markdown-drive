class WebhookProcessingWorker
  include Sidekiq::Worker
  def perform(webhook_event_id)
    webhook_event = WebhookEvent.find(webhook_event_id)
    user = webhook_event.user
    if user != nil
      modified_files = []
      deleted_files = []
      webhook_event.payload.json[:commits].reverse_each do |commit|
        (commit["added"] + commit["modified"]).each do |file|
          modified_files.push(file) unless modified_files.include? file
        end

        commit["removed"].each do |file|
          modified_files.delete(file) if modified_files.include? file
        end
      end

      client = Octkit::Client.new :access_token => user.github_token
    end
  end
end
