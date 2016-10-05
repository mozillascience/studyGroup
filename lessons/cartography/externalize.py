#!/usr/bin/env python3
# Externalize PNG images from markdown files converted by nbconvert.

import argparse
import os
from base64 import b64decode


parser = argparse.ArgumentParser()
parser.add_argument('input')
parser.add_argument('output')
args = parser.parse_args()

figure_dir = os.path.splitext(args.input)[0] + '_files'

with open(args.input) as fd:
    lesson = fd.readlines()

img_count = 0
with open(args.output, 'w') as fd:
    for line in lesson:
        if line.startswith('<img'):
            prefix = '<img src="data:image/png;base64,'
            suffix = '">'
            img_count += 1
            img = b64decode(line[len(prefix):-len(suffix)])
            fig_path = os.path.join(figure_dir,
                                    'figure_%d.png' % (img_count, ))
            with open(fig_path, 'wb') as ifd:
                ifd.write(img)
            fd.write('![figure %d](../%s)\n' % (img_count, fig_path))
        elif line.startswith('    <') and line.endswith('>\n'):
            continue
        else:
            fd.write(line)
