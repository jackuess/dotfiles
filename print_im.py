import collections
import itertools
import operator
import re
import sys

# convert -thumbnail 80x80 img.jpeg txt:- > img.txt

pattern = re.compile(r"^(?P<col>\d+),(?P<line>\d+): \((?P<red>-?\d+)(\.\d+)?,(?P<green>-?\d+)(\.\d+)?,(?P<blue>-?\d+)(\.\d+)?,(?P<alpha>\d+)")

Pixel = collections.namedtuple("Pixel", ("col", "line", "red", "green", "blue", "alpha"))


def printstackedpixels(top, bottom=Pixel(0, 0, 0, 0, 0, 255)):
    sys.stdout.write("\033[38;2;{top.red};{top.green};{top.blue}m"
                     "\033[48;2;{top.red};{top.green};{top.blue}m\u2580".format(top=top, bottom=bottom))


def parseline(line):
    pixel = pattern.match(line).groupdict()
    pixel["line"] = int(pixel["line"])
    for color in ["red", "green", "blue"]:
        pixel[color] = int(int(pixel[color]) / 65535 * 255)
    return Pixel(**pixel)


def linegroup(pixel):
    return pixel.line - (pixel.line % 2)


if __name__ == "__main__":
    with open(sys.argv[1]) as f:
        lines = (parseline(line) for line in f
                 if not line.startswith("#"))
        for _, pixelgroup in itertools.groupby(lines, linegroup):
            for _, pixels in itertools.groupby(sorted(pixelgroup, key=operator.attrgetter("col")),
                                               key=operator.attrgetter("col")):
                printstackedpixels(*pixels)
            print()
