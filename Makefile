
install_path = /usr/bin

# ipfs swarm peers will return an error if it is not connected.
ipfs-check:
	# checking if ipfs is online...
	ipfs swarm peers >/dev/null

# publish the whole directory. yup.
publish: ipfs-check
	$(eval _published_hash := `ipfs add -q -r viewers </dev/null | tail -n1`)
	@echo "published at /ipfs/${_published_hash}"

# install to $install_path
install: bin/d3view
	@cp "bin/d3view" "$(install_path)/d3view"
	@echo "installed at $(install_path)/d3view"
