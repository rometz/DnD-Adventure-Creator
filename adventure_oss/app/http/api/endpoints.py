from .middlewares import login_required
from flask import Flask, json, g, request
from app.adventure.service import Service as Adventure
from app.adventure.schema import AdventureSchema
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route("/adventures", methods=["GET"])
@login_required
def index():
    return json_response(Adventure(g.user).find_all_adventures())


@app.route("/adventures", methods=["POST"])
@login_required
def create():
    adventure_repo = AdventureSchema().load(json.loads(request.data))

    if adventure_repo.errors:
        return json_response({'error': adventure_repo.errors}, 422)

    adv = Adventure(g.user).create_adventure_for(adventure_repo)
    return json_response(adv)


