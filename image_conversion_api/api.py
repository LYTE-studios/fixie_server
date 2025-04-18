import base64
import datetime
import os

from cairosvg import svg2png
from fastapi import Request, Response, FastAPI

app = FastAPI()


@app.post("/svg-to-png")
async def convert_svg_to_png(request: Request):
    name = "{}.png".format(datetime.datetime.now().timestamp())

    svg_code = await request.body()

    svg2png(bytestring=svg_code, write_to=name, output_width=512, output_height=512)

    with open(name, "rb") as image:
        decoded_bytes = image.read()

    os.remove(name)

    b = base64.b64encode(decoded_bytes)

    return Response(
        content=b,
    )
