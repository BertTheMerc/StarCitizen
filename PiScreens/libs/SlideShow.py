from typing import Any, List, Optional

class SlideshowItem:
    def __init__(self, name: str, image):
        self.name = name
        self.image = image


class Slideshow:
    def __init__(self):
        self._images: List[SlideshowItem] = []

    @property
    def images(self) -> List[SlideshowItem]:
        return self._images

    def add(self, name: str, img):
        self._images.append(SlideshowItem(name=name, image=img))

    def get(self, key) -> Optional[SlideshowItem]:
        if isinstance(key, str):
            for item in self._images:
                if item.name == key:
                    return item
            return None
        elif isinstance(key, int):
            if 0 <= key < len(self._images):
                return self._images[key]
            return None
        else:
            raise TypeError("Key must be a string (name) or an integer (index)")

    @property
    def count(self) -> int:
        return len(self._images)
