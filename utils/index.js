module.exports.mapUsers = (userArray) => {
  return userArray
    .map(
      ({
        name: { first, last },
        gender,
        email,
        dob: { date }
      }) =>
        `('${first}', 
        '${last}', 
        '${email}', 
        ${Boolean(Math.random() > 0.5)}, 
        '${date}', 
        '${gender}')`
    )
    .join(",");
};

/*
`('(${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe})`,
`('(${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe})`,
`('(${user.firstName}', '${user.lastName}', '${user.email}', ${user.isSubscribe})`
*/
