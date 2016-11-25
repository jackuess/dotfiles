import operator
import re
import sys

# convert -thumbnail 80x80 img.jpeg txt:- > img.txt

pattern = re.compile(r"^(?P<col>\d+),(?P<line>\d+): \((?P<red>-?\d+)(\.\d+)?,(?P<green>-?\d+)(\.\d+)?,(?P<blue>-?\d+)(\.\d+)?,(?P<alpha>\d+)")


def printpixel(r, g, b):
    sys.stdout.write("\033[48;2;{red};{green};{blue}m ".format(red=r, green=g, blue=b))


def parseline(line):
    pixel = pattern.match(line).groupdict()
    pixel["line"] = int(pixel["line"])
    for color in ["red", "green", "blue"]:
        pixel[color] = int(int(pixel[color]) / 65535 * 255)
    return pixel

if __name__ == "__main__":
    lineno = 0
    with open(sys.argv[1]) as f:
        for line in f:
            if line.startswith("#"):
                continue

            pixel = parseline(line)
            if pixel["line"] > lineno:
                sys.stdout.write("\n")
                lineno = pixel["line"]
            printpixel(pixel["red"], pixel["green"], pixel["blue"])

    print()
