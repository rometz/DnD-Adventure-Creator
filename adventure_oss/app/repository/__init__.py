class Repository(object):
    def __init__(self, adapter=None):
        self.client = adapter()

    def find_all(self, selector):
        return self.client.find_all(selector)
 
    def find(self, selector):
        return self.client.find(selector)

    def create(self, adventure):
        return self.client.create(adventure)

    def update(self, selector, adventure):
        return self.client.update(selector, adventure)

    def delete(self, selector):
        return self.client.delete(selector)