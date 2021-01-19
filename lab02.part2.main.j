/*
  Import the ip-cidr npm package.
  See https://www.npmjs.com/package/ip-cidr

  The ip-cidr package exports a class.
  Assign the class definition to variable IPCIDR.
*/
const IPCIDR = require('ip-cidr');

/*
  Import the built-in path module.
  See https://nodejs.org/api/path.html

  The path module provides utilities for working with file and directory paths.
  IAP requires the path module to access local file modules.
  The path module exports an object.
  Assign the imported object to variable path.
*/
const path = require ('path');
//const path = require('https://github.com/fpatka/app-ip_address/');

/**
* Import helper function module located in the same directory
* as this module. IAP requires the path object's join method
* to unequivocally locate the file module.
*/
const { getIpv4MappedIpv6Address } = require(path.join(__dirname, 'ipv6.js'));
//const { getIpv4MappedIpv6Address } = require(path.join('blob/master', './ipv6.js'));

/**
* Calculate and return the first host IP address from a CIDR subnet.
* @param {string} cidrStr - The IPv4 subnet expressed
*                 in CIDR format.
* @param {callback} callback - A callback function.
* @return {string} (firstIpAddress) - An IPv4 address.
*/
function getFirstIpAddress(cidrStr, callback) {

  // Initialize return arguments for callback
  let firstIpAddress = null;
  let callbackError = null;

  // Instantiate an object from the imported class and assign the instance to variable cidr.
  const cidr = new IPCIDR(cidrStr);
  // Initialize options for the toArray() method.
  // We want an offset of one and a limit of one.
  // This returns an array with a single element, the first host address from the subnet.
  const options = {
    from: 1,
    limit: 1
  };