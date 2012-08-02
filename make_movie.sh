#!/bin/bash

# Simple Camera Image Archiver by Stephen Cropp of skcservices.com
# Copyright (C) 2011 by Stephen Cropp

# This script is released under the terms of the BSD license.
# You can find a summary and text of the license terms at the following website
# http://creativecommons.org/licenses/BSD/

# THIS SOFTWARE IS PROVIDED BY STEPHEN CROPP "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


original_images=$1
temporary_images=tmp

mkdir -p $temporary_images

x=1;
for f in $(ls -r -t $original_images/*.JPG); do
        counter=$(printf %04d $x);
        ln "$f" "$temporary_images/$counter.jpg";
        x=$(($x+1));
done
ffmpeg -y -f image2 -r 20 -i "$temporary_images/%04d.jpg" "$original_images.avi"

rm -r $temporary_images