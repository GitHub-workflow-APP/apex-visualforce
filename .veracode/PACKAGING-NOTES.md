# Notes

The only interesting thing about Apex packaging is that the `.cls` file overlaps
with VB6 (which is currently unsupported by the packager but supported by Static).
As a heuristic we can look for `.vbp` or `.vbg` files to see if the repo contains VB6.
If so, then we should not package anything from the repo.

Other than that packaging is not very interesting here,
just get all the supported file types and put them in a ZIP file.
