var { queryRow, queryValue } = require('pine2e').pg;

exports.claimLicense = claimLicense;
exports.countUnclaimedLicenses = countUnclaimedLicenses;

function claimLicense(ctx, params) {
  return queryRow(ctx, "UPDATE licenses SET claimed = TRUE, claimed_at = NOW(), claim_store = $1, claim_txn = $2, claim_qty = 1, claim_first_name = $3, claim_last_name = $4, claim_email = $5 WHERE id IN (SELECT id FROM licenses WHERE product_code = 'LR' AND license_type = 'A' AND NOT claimed LIMIT 1) RETURNING id, license_code as \"licenseCode\";", params.store, params.txn, params.firstName, params.lastName, params.email);
}

function countUnclaimedLicenses(ctx) {
  return queryValue(ctx, "SELECT COUNT(*) FROM licenses WHERE product_code = 'LR' AND license_type = 'A' AND NOT claimed");
}
