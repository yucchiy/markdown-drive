class WebhooksController < ApplicationController

  def index
    if github_delivery_id.present? && github_event_type != nil && github_event_type == 'push'
      pull_repository json_params
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

  def pull_repository(json)
    if json["ref"] == "ref/heads/master"
      webhook_event = WebhookEvent.create do |w|
        w.github_delivery_id = github_delivery_id
        w.ref = json["ref"]
        w.head_commit_id = json["head_commit"]["id"]
        w.payload_json = Oj.dump(json, :mode => :compat)
        w.user_id = User.first.id
      end

      pp webhook_event

      webhook_event.save
    end
  end
end
