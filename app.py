from flask import Flask, jsonify, request, render_template
from flask_sqlalchemy import SQLAlchemy
import urllib
import pyodbc


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:123456@127.0.0.1/tutpoint'
db = SQLAlchemy(app)
SQLALCHEMY_TRACK_MODIFICATIONS = False


db = SQLAlchemy(app)


class NewCard(db.Model):
    id = db.Column('id', db.Integer, primary_key=True,
                   autoincrement=True, nullable=False)
    cardNo = db.Column(db.String(100))
    cardType = db.Column(db.String(50))
    amount = db.Column(db.Integer)


def __init__(self, name, city, addr, pin):
    self.name = name
    self.city = city
    self.addr = addr
    self.pin = pin



# post /card data: {id :}
@app.route('/cards', methods=['POST'])
def create_card():
    cards=[]
    request_data = request.get_json()
    new_cards = NewCard(
        # "id": request_data["id"],
        cardNo=request_data["cardNo"],
        cardType=request_data["cardType"],
        amount=request_data["amount"],
    )
    print(new_cards.amount)
    db.session.add(new_cards)
    db.session.commit()
    result = db.session.query(NewCard).all()
    for x in result:
        recordObject = {
                'id': x.id,
                'cardNo': x.cardNo,
                'cardType': x.cardType,
                'amount': x.amount,
            }
        cards.append(recordObject)
        

    return  jsonify({'cards':recordObject})
    # pass

# # get /card/<id> data: {id :}
# @app.route('/card/<string:id>')
# def get_card(id):
#     for card in cards:
#         print(id)
#         if card['id'] == id:
#             return jsonify(card)
#     return jsonify({'message': 'card msy not found'})
#     # pass

# get /card
@app.route('/card', methods=['GET'])
def get_cards():
    # print(NewCard.query(all))
    cards=[]
    
    result = db.session.query(NewCard).all()
    for x in result:
        recordObject = {
                'id': x.id,
                'cardNo': x.cardNo,
                'cardType': x.cardType,
                'amount': x.amount,
            }
        cards.append(recordObject)
        

    return  jsonify({'cards':cards})
    # pass


# # get /card/<id>/item data: {id :}
# @app.route('/card/<string:id>')
# def get_item_in_card(id):
#     for card in cards:
#         if card['id'] == id:
#             return jsonify({'id': card['id']})
#     return jsonify({'message': 'card ...... why not found'})

    # pass


if __name__ == '__main__':
    db.create_all()
    app.run(host='192.168.43.163', port=5000)
