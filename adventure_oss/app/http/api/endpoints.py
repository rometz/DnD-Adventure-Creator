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

