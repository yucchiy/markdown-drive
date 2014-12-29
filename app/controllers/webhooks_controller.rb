class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    if github_delivery_id.present? && github_event_type != nil && github_event_type == 'push'
      receive_event json_params
      render :text => 'OK'
    else
      render :text => 'NG'
    end
  end

  private
  def json_params
    request.body.rewind
   Oj.load(request.body.read, :mode => :compat)
  end

  def github_delivery_id
    request.headers["X-Github-Delivery"]
  end

  def github_event_type
    request.headers["X-Github-Event"]
  end

  def receive_event(json)
    user = User.find_by github_id: json["sender"]["id"]
    if user.present?

      repository = Repository.find_or_create_by(github_repository_id: json["repository"]["id"]) do |r|
        r.github_repository_id = json["repository"]["id"]
        r.user = user
      end

      repository.name = json["repository"]["name"]
      repository.full_name = json["repository"]["full_name"]
      repository.master_branch = json["repository"]["master_branch"]
      repository.save

      webhook_event = WebhookEvent.create do |w|
        w.repository = repository
        w.github_delivery_id = github_delivery_id
        w.ref = json["ref"]
        w.head_commit_id = json["head_commit"]["id"]
        w.payload_json = Oj.dump(json, :mode => :compat)
      end

      webhook_event.save
    end
  end
end
