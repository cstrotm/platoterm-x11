/**
 * PLATOTerm X11 - A PLATO Terminal for the Unix X11 GUI
 * Based on Steve Peltz's PAD
 *
 * Author: Thomas Cherryhomes <thom.cherryhomes at gmail dot com>
 *
 * screen.h - Display output functions
 */

#ifndef SCREEN_H
#define SCREEN_H

#include "protocol.h"

static void _NewFill(XImage *image, int x, int y, int width, int height,
                     unsigned long oldpixel, unsigned long newpixel);
static void NewFillCore(XImage *image, int x, int y, int width, int height,
                        unsigned long oldpixel, unsigned long newpixel);


#endif /* SCREEN_H */
