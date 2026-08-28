# Multiple Inheritance
class Camera:
    def take_photo(self):
        print("Taking photo")

class MusicPlayer:
    def play_music(self):
        print("Playing music")

class Smartphone(Camera, MusicPlayer):
    def call(self):
        print("Making a call")

phone = Smartphone()
phone.take_photo()
phone.play_music()
phone.call()