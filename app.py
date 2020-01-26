from flask import Flask, jsonify, request, render_template

app = Flask(__name__)

cards = [{
    'id': '1',
    'cardNo': '123323-4545-5657',
    'cardType': 'Visa',
    'amount': 12344,
}]


# post /card data: {id :}
@app.route('/cards', methods=['POST'])
def create_card():
    request_data = request.get_json()
    new_cards = {
        'id': request_data["id"],
        'cardNo': request_data["cardNo"],
        'cardType': request_data["cardType"],
        'amount': request_data["amount"],
    }
    cards.append(new_cards)
    return jsonify(cards)
    # pass

# get /card/<id> data: {id :}
@app.route('/card/<string:id>')
def get_card(id):
    for card in cards:
        if card['id'] == id:
            return jsonify(card)
    return jsonify({'message': 'card not found'})
    # pass

#get /card
@app.route('/card')
def get_cards():
    print(cards)
    return jsonify({'cards': cards})
    # pass

# post /card/<id> data: {id :}
@app.route('/card/<string:id>/item', methods=['POST'])
def create_item_in_card(id):

    request_data = request.get_json()
    print(request_data)
    for card in cards:
        if card['id'] == id:
            new_item = {
                'id': request_data["id"],
                'cardNo': request_data["cardNo"],
                'cardType': request_data["cardType"],
                'amount': request_data["amount"],
            }
            card['items'].append(new_item)
            return jsonify(card)
    return jsonify({'message': 'card not found'})
    # pass

# get /card/<id>/item data: {id :}
@app.route('/card/<string:id>/item')
def get_item_in_card(id):
    for card in cards:
        if card['id'] == id:
            return jsonify({'id': card['id']})
    return jsonify({'message': 'card not found'})

    # pass


app.run(port=5000)
